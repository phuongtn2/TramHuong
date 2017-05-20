package com.tramhuong.services.impl;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.PostDto;
import com.tramhuong.mapper.BlogMapper;
import com.tramhuong.mapper.PostMapper;
import com.tramhuong.services.BlogService;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogMapper blogMapper;
    @Autowired
    private PostMapper postMapper;
    @Override
    public int add(BlogDto blogDto) throws ServiceException {
        return blogMapper.add(blogDto);
    }

    @Override
    public void update(BlogDto blogDto) throws ServiceException {
        blogMapper.update(blogDto);
    }

    @Override
    public void delete(int id) throws ServiceException {
        blogMapper.delete(id);
    }

    @Override
    public BlogDto findById(int id) throws ServiceException {
        return blogMapper.findById(id);
    }

    @Override
    public List<BlogDto> findAll() throws ServiceException {
        return blogMapper.findAll();
    }

    @Override
    public List<BlogDto> findByStatus(byte status){
        return blogMapper.findByStatus(status);
    }

    /*Function<Byte, List<BlogDto>> fMemoizerByStatus = this::findByStatus;
    Function<Byte, List<BlogDto>> gMemoizerByStatus = Memoizer.memoize(fMemoizerByStatus);
    @Override
    public List<BlogDto> findByStatusMemoizer(byte status) {
        return gMemoizerByStatus.apply(status);
    }*/

    @Override
    public List<PostDto> findPostByBlogId(int id, byte status) throws ServiceException {
        return postMapper.findByBlogId(id, status);
    }

    @Override
    public List<PostDto> findPostNew() throws ServiceException {
        return postMapper.findPostNew();
    }

    @Override
    public PostDto findPostById(long id) throws ServiceException {
        return postMapper.findById(id);
    }

    @Override
    public long addPost(PostDto postDto) throws ServiceException {
        return postMapper.add(postDto);
    }

    @Override
    public void updatePost(PostDto postDto) throws ServiceException {
        postMapper.update(postDto);
    }

    @Override
    public List<PostDto> findByStatus() throws ServiceException {
        return postMapper.findByStatus();
    }
}
