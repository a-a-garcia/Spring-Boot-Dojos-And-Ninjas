package com.codingdojo.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.repositories.DojoRepository;


@Service
public class DojoService {
	    // adding the object repository as a dependency
		@Autowired
	    private DojoRepository dojoRepository;
	    
	    // returns all the object
	    public List<Dojo> allDojo() {
	        return dojoRepository.findAll();
	    }
	    // creates a object
	    public Dojo createDojo(Dojo object) {
	        return dojoRepository.save(object);
	    }
	    // update a object - it's the same as create, however if a primary key already exists, it will update instead of create.
	    public Dojo updateDojo(Dojo object) {
	        return dojoRepository.save(object);
	    }
	    // retrieves a object
	    public Dojo findDojo(Long id) {
	        Optional<Dojo> optionalDojo = dojoRepository.findById(id);
	        if(optionalDojo.isPresent()) {
	            return optionalDojo.get();
	        } else {
	            return null;
	        }
	    }
	    // delete a object
	    public void deleteDojo(Long id) {
	    	dojoRepository.deleteById(id);
	    }
}
