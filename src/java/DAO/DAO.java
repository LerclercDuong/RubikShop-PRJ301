/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author doant
 */
public interface DAO<T> {
    public T create(); 
    public T delete();
    public T read();
    public T update();
    public T findByKeyWord();
}
