package com.itda.ITDA.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.cache.CacheManager;
import org.springframework.cache.ehcache.EhCacheCache;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.sf.ehcache.Ehcache;

@RestController
@RequestMapping("/api/ehcache")
public class EhcacheController {
	private CacheManager cacheManager;

    public EhcacheController(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    @GetMapping("/all")
    public ResponseEntity<Object> couponList() {
    	List<Map<String, List<String>>> result = new ArrayList<>();

        for (String cacheName : cacheManager.getCacheNames()) {
            EhCacheCache cache = (EhCacheCache) cacheManager.getCache(cacheName);
            Ehcache ehcache = cache.getNativeCache();
            Map<String, List<String>> entry = new HashMap<>();

            for (Object key : ehcache.getKeys()) {
                net.sf.ehcache.Element element = ehcache.get(key);
                if (element != null) {
                    entry.computeIfAbsent(cacheName, k -> new ArrayList<>()).add(element.toString());
                }
            }

            result.add(entry);
        }
    	return ResponseEntity.ok()
        	.body(result);
    	
    }
}
