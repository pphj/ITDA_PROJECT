package com.itda.ITDA.domain;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NaverDTO {
    private String id;
    private String email;
    private String name;
@Getter
    private String access_token;
}

