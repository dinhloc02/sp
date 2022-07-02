/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Abouts;
import java.util.List;

/**
 *
 * @author LeDung
 */
public interface AboutsDAO {

    public long Count();

    public long CountFind(String name);

    public List<Abouts> getAllAbouts(Integer currentPage, Integer recordsPerPage);

    public Abouts getAboutById(Integer id);

    public Boolean insertAbout(Abouts a);

    public Boolean updateAbout(Abouts a);

    public Boolean deleteAbout(Integer id);

    public List<Abouts> getAboutsFindByName(String aboutName, Integer currentPage, Integer recordsPerPage);
}
