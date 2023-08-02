package com.codingdojo.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.repositories.NinjaRepository;


@Service
public class NinjaService {
	    // adding the object repository as a dependency
		@Autowired
	    private NinjaRepository ninjaRepository;
	    
	    // returns all the object
	    public List<Ninja> allNinja() {
	        return ninjaRepository.findAll();
	    }
	    // creates a object
	    public Ninja createNinja(Ninja object) {
	        return ninjaRepository.save(object);
	    }
	    // update a object - it's the same as create, however if a primary key already exists, it will update instead of create.
	    public Ninja updateNinja(Ninja object) {
	        return ninjaRepository.save(object);
	    }
	    // retrieves a object
	    public Ninja findNinja(Long id) {
	        Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
	        if(optionalNinja.isPresent()) {
	            return optionalNinja.get();
	        } else {
	            return null;
	        }
	    }
	    // delete a object
	    public void deleteNinja(Long id) {
	    	ninjaRepository.deleteById(id);
	    }
}
