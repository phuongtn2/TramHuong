package com.tramhuong.mapper;

import com.tramhuong.dto.BlogDto;
import com.tramhuong.dto.PostDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by PhuongTN1 on 11/4/2016.
 */
public interface PostMapper {
    long add(@Param("dto") PostDto postDto);
    void update(@Param("dto") PostDto postDto);
    void delete(@Param("id") long id);
    PostDto findById(@Param("id") long id);
    List<PostDto> findAll();
    List<PostDto> findByBlogId(@Param("id") int id);
}
