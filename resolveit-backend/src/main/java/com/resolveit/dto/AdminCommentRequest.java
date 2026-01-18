package com.resolveit.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminCommentRequest {
    private String message;
    private boolean isPrivate;


}
