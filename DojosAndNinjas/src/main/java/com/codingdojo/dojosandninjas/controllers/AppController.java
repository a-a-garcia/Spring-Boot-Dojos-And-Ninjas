package com.codingdojo.dojosandninjas.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.services.DojoService;
import com.codingdojo.dojosandninjas.services.NinjaService;

import jakarta.validation.Valid;

@Controller
public class AppController {
	
	@Autowired
	private DojoService dojoService;
	@Autowired
	private NinjaService ninjaService;
	
	
	@GetMapping("/dojos/new")
	public String createDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "createDojo.jsp";
	}
	
	@PostMapping("/dojos/new")
	public String submitDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "createDojo.jsp";
		} else {
			dojoService.createDojo(dojo);
			model.addAttribute("dojo", dojo);
			return "redirect:/dojos/" + dojo.getId();
		}
	}
	
	@GetMapping("dojos/{dojoid}")
	public String showDojo(@PathVariable Long dojoid,  Model model) {
		Dojo dojo = dojoService.findDojo(dojoid);
		model.addAttribute(dojo);
		return "showDojo.jsp";
	}
	
	@GetMapping("/ninjas/new")
	public String createNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("allDojos", dojoService.allDojo());
		return "createNinja.jsp";
	}
	
	@PostMapping("/ninjas/new")
	public String submitNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("allDojos", dojoService.allDojo());
			return "createNinja.jsp";
		} else {
			Dojo selectedDojo = ninja.getDojo();
			ninjaService.createNinja(ninja);
			return "redirect:/dojos/" + selectedDojo.getId();
		}
	}
}
