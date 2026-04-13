package com.nirvachansetu.dao;

import com.nirvachansetu.model.Constituency;

import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Data Access Object for Constituency entity.
 */
public class ConstituencyDAO extends GenericDAO<Constituency, Integer> {

    public ConstituencyDAO() {
        super(Constituency.class);
    }

    /**
     * Finds all constituencies in a specific district.
     *
     * @param district the district name
     * @return a list of constituencies in the district
     */
    public List<Constituency> findByDistrict(String district) {
        try {
            TypedQuery<Constituency> query = em.createQuery(
                    "SELECT c FROM Constituency c WHERE c.district = :district ORDER BY c.name",
                    Constituency.class);
            query.setParameter("district", district);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding constituencies by district: " + district, e);
        }
    }

    /**
     * Finds all constituencies in a specific province.
     *
     * @param province the province name
     * @return a list of constituencies in the province
     */
    public List<Constituency> findByProvince(String province) {
        try {
            TypedQuery<Constituency> query = em.createQuery(
                    "SELECT c FROM Constituency c WHERE c.province = :province ORDER BY c.name",
                    Constituency.class);
            query.setParameter("province", province);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding constituencies by province: " + province, e);
        }
    }
}
