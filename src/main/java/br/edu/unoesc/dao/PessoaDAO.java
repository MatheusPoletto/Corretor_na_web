package br.edu.unoesc.dao;

import javax.enterprise.context.RequestScoped;

import br.edu.unoesc.model.Pessoa;

@RequestScoped
public class PessoaDAO extends HibernateDAO<Pessoa>{

}
