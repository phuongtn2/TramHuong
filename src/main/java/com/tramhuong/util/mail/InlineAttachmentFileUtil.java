package com.tramhuong.util.mail;

import javax.activation.*;
import javax.mail.MessagingException;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InlineAttachmentFileUtil {
	private static final Pattern URL_PREFIX = Pattern.compile( "^(http|https|ftp):.+$");
	private static final Pattern CLASSPATH_PREFIX = Pattern.compile("^(classpath):(.+)$");
	private static final Map<String, String> localFileTypeMap = Collections.unmodifiableMap(new HashMap<String, String>(){{
		put("css", "text/css");
		put("js", "text/javascript");
	}});

	public static String loadUTF8StringContent(Map<Pattern, String> replaceMap, String path) {
		try {
			final DataHandler dh = createDataHandler(replaceMap, path);
			return readStringFromDataSource(dh, StandardCharsets.UTF_8);
		} catch (MessagingException e) {
			return null;
		}
	}
	public static DataHandler createDataHandler(Map<Pattern, String> replaceMap, String srcResourceLocation) throws MessagingException {
		DataSource ds = null;
		if(srcResourceLocation==null) {
			throw new MessagingException("attachment/inline data path or url is null");
		}
		final String resourceLocation = replaceUrlPattern(replaceMap, srcResourceLocation);
		if(URL_PREFIX.matcher(resourceLocation).matches()) {
			URL url = null;
			try {
				url = new URL(resourceLocation);
			} catch (MalformedURLException e) {
				throw new MessagingException("attachment/inline url error:"+resourceLocation, e);
			}
			ds = new URLDataSource(url);
		} else if(CLASSPATH_PREFIX.matcher(resourceLocation).matches()) {
			ds = new ClasspathDataSource(resourceLocation.substring(resourceLocation.indexOf(":")+1));
		} else {
			ds = new FileDataSource(new File(resourceLocation));
		}

		final DataHandler dh = new DataHandler(ds);
		return dh;
	}
	protected static String replaceUrlPattern(Map<Pattern, String> replaceMap,  String srcResourceLocation) {
		if (replaceMap != null) {
			for (Map.Entry<Pattern, String> me : replaceMap.entrySet()) {
				final Pattern p = me.getKey();
				final Matcher m = p.matcher(srcResourceLocation);
				if (m.matches()) {
					return m.replaceFirst(me.getValue());
				}
			}
		}
		return srcResourceLocation;
	}
	protected static String readStringFromDataSource(DataHandler dh, Charset cs) {
		final StringBuilder buf = new StringBuilder();
		try {
			final BufferedReader br = new BufferedReader(new InputStreamReader(dh.getInputStream(), cs));
			try {
				String str = null;
				while ((str = br.readLine()) != null) {
					buf.append(str).append("\n");
				}
			} finally {
				br.close();
			}
		} catch (IOException e) {
			return null;
		}
		return buf.toString();
	}

	protected static class ClasspathDataSource implements DataSource {
		private final String classpath;
		public ClasspathDataSource(String classpath) {
			this.classpath = classpath;
		}

		@Override
		public OutputStream getOutputStream() throws IOException {
			throw new IOException("cannot do this");
		}

		@Override
		public String getName() {
			return classpath;
		}

		@Override
		public InputStream getInputStream() throws IOException {
			return this.getClass().getClassLoader().getResourceAsStream(classpath);
		}

		@Override
		public String getContentType() {
			final String path = classpath.toLowerCase();
			final int idx = path.lastIndexOf('.');
			final String ext = idx<0?path:path.substring(idx+1);
			if(localFileTypeMap.containsKey(ext)) {
				return localFileTypeMap.get(ext);
			} else {
				return FileTypeMap.getDefaultFileTypeMap().getContentType(classpath);
			}
		}
	}

}
