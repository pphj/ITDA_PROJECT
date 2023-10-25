package com.itda.ITDA;

import net.sf.ehcache.config.CacheConfiguration;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@EnableCaching
@Configuration
public class CacheConfig {
    @Bean
    public CacheManager cacheManager() {
        EhCacheCacheManager cacheManager = new EhCacheCacheManager();
        cacheManager.setCacheManager(ehCacheManager());
        return cacheManager;
    }

    @Bean(destroyMethod = "shutdown")
    public net.sf.ehcache.CacheManager ehCacheManager() {
        net.sf.ehcache.config.Configuration config = new net.sf.ehcache.config.Configuration();
        config.setName("__meeting");

        config.addCache(getCacheConfiguration("userTotal", 60*10));
        config.addCache(getCacheConfiguration("ContentAll", 60*10));
        config.addCache(getCacheConfiguration("ChannelList", 60*10));
        config.addCache(getCacheConfiguration("HotContent", 60*10));
        config.addCache(getCacheConfiguration("selectchCate_Id", 60*10));
        config.addCache(getCacheConfiguration("product", 60*10));
        config.addCache(getCacheConfiguration("totalSalesList", 60*10));
        
        return net.sf.ehcache.CacheManager.newInstance(config);
    }

    private CacheConfiguration getCacheConfiguration(String name, long second) {
        return getCacheConfiguration(name, second, 100L);
    }

    private CacheConfiguration getCacheConfiguration(String name, long second, long size) {
        CacheConfiguration cacheConfiguration = new CacheConfiguration();
        cacheConfiguration.setName(name);
        cacheConfiguration.setMemoryStoreEvictionPolicy("LRU");
        cacheConfiguration.setMaxEntriesLocalHeap(size);
        cacheConfiguration.setTimeToLiveSeconds(second);
        cacheConfiguration.setTimeToIdleSeconds(0L);

        return cacheConfiguration;
    }
}