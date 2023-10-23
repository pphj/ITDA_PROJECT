package com.itda.ITDA.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NaverDTO {
    private String id;
    private String email;
    private String name;
}

