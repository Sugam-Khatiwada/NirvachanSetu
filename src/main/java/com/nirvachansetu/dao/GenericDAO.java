package com.nirvachansetu.dao;

import com.nirvachansetu.config.EMFProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Generic Data Access Object providing common CRUD operations.
 *
 * @param <T>  the entity type
 * @param <ID> the primary key type
 */
public class GenericDAO<T, ID> {

    protected EntityManager em;
    protected Class<T> entityClass;

    /**
     * Creates a new GenericDAO for the given entity class.
     *
     * @param entityClass the entity class
     */
    public GenericDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
        this.em = EMFProvider.getEntityManagerFactory().createEntityManager();
    }

    /**
     * Finds an entity by its primary key.
     *
     * @param id the primary key
     * @return the entity, or null if not found
     */
    public T findById(ID id) {
        try {
            return em.find(entityClass, id);
        } catch (Exception e) {
            throw new RuntimeException("Error finding entity by ID: " + id, e);
        }
    }

    /**
     * Returns all entities of this type.
     *
     * @return a list of all entities
     */
    public List<T> findAll() {
        try {
            String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e";
            TypedQuery<T> query = em.createQuery(jpql, entityClass);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding all " + entityClass.getSimpleName() + " entities", e);
        }
    }

    /**
     * Saves a new entity (persist) or updates an existing one (merge).
     *
     * @param entity the entity to save
     * @return the saved entity
     */
    public T save(T entity) {
        EntityTransaction tx = null;
        try {
            tx = beginTransaction();
            if (em.contains(entity)) {
                entity = em.merge(entity);
            } else {
                em.persist(entity);
            }
            commitTransaction(tx);
            return entity;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                rollbackTransaction(tx);
            }
            throw new RuntimeException("Error saving " + entityClass.getSimpleName(), e);
        }
    }

    /**
     * Updates an existing entity using merge.
     *
     * @param entity the entity to update
     * @return the updated entity
     */
    public T update(T entity) {
        EntityTransaction tx = null;
        try {
            tx = beginTransaction();
            entity = em.merge(entity);
            commitTransaction(tx);
            return entity;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                rollbackTransaction(tx);
            }
            throw new RuntimeException("Error updating " + entityClass.getSimpleName(), e);
        }
    }

    /**
     * Deletes an entity.
     *
     * @param entity the entity to delete
     */
    public void delete(T entity) {
        EntityTransaction tx = null;
        try {
            tx = beginTransaction();
            // Merge first to ensure the entity is managed
            T managedEntity = em.merge(entity);
            em.remove(managedEntity);
            commitTransaction(tx);
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                rollbackTransaction(tx);
            }
            throw new RuntimeException("Error deleting " + entityClass.getSimpleName(), e);
        }
    }

    /**
     * Deletes an entity by its primary key.
     *
     * @param id the primary key of the entity to delete
     */
    public void deleteById(ID id) {
        EntityTransaction tx = null;
        try {
            tx = beginTransaction();
            T entity = em.find(entityClass, id);
            if (entity != null) {
                em.remove(entity);
            }
            commitTransaction(tx);
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                rollbackTransaction(tx);
            }
            throw new RuntimeException("Error deleting " + entityClass.getSimpleName() + " by ID: " + id, e);
        }
    }

    /**
     * Begins a new transaction.
     *
     * @return the EntityTransaction
     */
    public EntityTransaction beginTransaction() {
        EntityTransaction tx = em.getTransaction();
        if (!tx.isActive()) {
            tx.begin();
        }
        return tx;
    }

    /**
     * Commits the current transaction.
     *
     * @param tx the EntityTransaction to commit
     */
    public void commitTransaction(EntityTransaction tx) {
        if (tx != null && tx.isActive()) {
            tx.commit();
        }
    }

    /**
     * Rolls back the current transaction.
     *
     * @param tx the EntityTransaction to roll back
     */
    public void rollbackTransaction(EntityTransaction tx) {
        if (tx != null && tx.isActive()) {
            tx.rollback();
        }
    }

    /**
     * Returns the count of all entities.
     *
     * @return the total count
     */
    public long count() {
        try {
            String jpql = "SELECT COUNT(e) FROM " + entityClass.getSimpleName() + " e";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            return query.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException("Error counting " + entityClass.getSimpleName() + " entities", e);
        }
    }

    /**
     * Clears the EntityManager persistence context.
     * NOTE: We do NOT close the EM here because the same DAO/EM instance
     * is reused across multiple service method calls. Closing the EM would
     * cause "EntityManager is closed" errors on subsequent calls.
     * The EM will be garbage collected when the DAO instance is discarded.
     */
    public void close() {
        if (em != null && em.isOpen()) {
            em.clear();
        }
    }
}