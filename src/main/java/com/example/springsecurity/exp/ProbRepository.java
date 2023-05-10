package com.example.springsecurity.exp;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProbRepository extends CrudRepository<Prob, Integer> { List<Prob> findAll();}
