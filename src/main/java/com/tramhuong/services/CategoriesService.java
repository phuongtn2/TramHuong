package com.tramhuong.services;
import com.tramhuong.dto.CategoryDto;
import com.tramhuong.services.error.ServiceException;
import java.util.List;

/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface CategoriesService {
    long add(CategoryDto categoryDto) throws ServiceException;
    void delete(long id) throws ServiceException;
    void update(CategoryDto categoryDto) throws ServiceException;
    List<CategoryDto> findByStatus(byte status) throws ServiceException;
    //List<CategoryDto> findByStatusMemoizer(byte status);
    List<CategoryDto> findAll() throws ServiceException;
    CategoryDto findById(long id) throws ServiceException;

    long addS(CategoryDto categoryDto) throws ServiceException;
    void deleteS(long id) throws ServiceException;
    void updateS(CategoryDto categoryDto) throws ServiceException;
    List<CategoryDto> findByStatusS(byte status) throws ServiceException;
    //List<CategoryDto> findByStatusSMemoizer(byte status);
    List<CategoryDto> findAllS() throws ServiceException;
    CategoryDto findByIdS(long id) throws ServiceException;
    List<CategoryDto> findByParent(long id) throws ServiceException;
    //List<CategoryDto> findByParentMemoizer(long id);
}
