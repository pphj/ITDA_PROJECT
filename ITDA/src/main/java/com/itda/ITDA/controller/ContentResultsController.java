package com.itda.ITDA.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.service.MainService;

@RestController
@RequestMapping("/api/content-results")
public class ContentResultsController {

    @Autowired
    private MainService mainService;

    @GetMapping("/{page}")
    public List<ChBoard> getContentResultsByPage(
        @PathVariable int page,
        @RequestParam("keyword") String keyword,
        @RequestParam("pageSize") int pageSize) {
        
        int offset = (page - 1) * pageSize;
        List<ChBoard> contentResults = mainService.searchContentsByKeyword(keyword, pageSize, offset);
        
        return contentResults;
    }

}
