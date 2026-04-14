package com.nirvachansetu.config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

/**
 * Singleton provider for EntityManagerFactory.
 * Used across the application to create EntityManager instances.
 */
public class EMFProvider {

    private static final String PERSISTENCE_UNIT = "NirvachanSetuPU";
    private static EntityManagerFactory emf;

    private EMFProvider() {
    }

    public static EntityManagerFactory getEntityManagerFactory() {
        if (emf == null || !emf.isOpen()) {
            emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        }
        return emf;
    }

    public static void shutdown() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
