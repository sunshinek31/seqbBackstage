package com.sunshinek31.seqb.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("showMain")
	public String showMain(Model model){
		return "main";
	}
}
