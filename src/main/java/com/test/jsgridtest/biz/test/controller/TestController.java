package com.test.jsgridtest.biz.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping(value="/aui/test")
    public String Main() {
        return "aui/test";
    }
}