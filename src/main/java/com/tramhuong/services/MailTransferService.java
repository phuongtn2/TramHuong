package com.tramhuong.services;

import com.tramhuong.dto.MailSenderDto;
import com.tramhuong.dto.SendMailParameter;
import com.tramhuong.dto.SendMailPersonalDto;
import com.tramhuong.services.error.ServiceException;

public interface MailTransferService {
	void sendCustomerEmail(MailSenderDto sender, SendMailPersonalDto dto, SendMailParameter param, String logPrefix, boolean isFirst) throws ServiceException;
}
