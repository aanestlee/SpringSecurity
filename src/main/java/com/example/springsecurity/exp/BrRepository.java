package com.example.springsecurity.exp;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BrRepository extends CrudRepository<Br, Integer> { List<Br> findAll();}


