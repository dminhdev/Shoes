package com.shoes.applications.service;

import org.springframework.stereotype.Service;

import com.shoes.applications.entity.Comment;
import com.shoes.applications.model.request.CreateCommentPostRequest;
import com.shoes.applications.model.request.CreateCommentProductRequest;

@Service
public interface CommentService {
    Comment createCommentPost(CreateCommentPostRequest createCommentPostRequest,long userId);
    Comment createCommentProduct(CreateCommentProductRequest createCommentProductRequest, long userId);
}
