package com.sjcj.service;

import java.util.List;

import com.sjcj.model.UrlPattern;

public interface UrlpatternManager {
                 public UrlPattern get(Long id);
                 public List<UrlPattern> getAll();
}
