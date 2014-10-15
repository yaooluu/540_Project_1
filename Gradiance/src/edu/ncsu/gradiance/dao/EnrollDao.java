package edu.ncsu.gradiance.dao;

// Generated Oct 15, 2014 11:32:10 AM by Hibernate Tools 4.3.1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class Enroll.
 * @see edu.ncsu.gradiance.dao.Enroll
 * @author Hibernate Tools
 */
public class EnrollDao {

	private static final Log log = LogFactory.getLog(EnrollDao.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Enroll transientInstance) {
		log.debug("persisting Enroll instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Enroll instance) {
		log.debug("attaching dirty Enroll instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Enroll instance) {
		log.debug("attaching clean Enroll instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Enroll persistentInstance) {
		log.debug("deleting Enroll instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Enroll merge(Enroll detachedInstance) {
		log.debug("merging Enroll instance");
		try {
			Enroll result = (Enroll) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Enroll findById(java.lang.Integer id) {
		log.debug("getting Enroll instance with id: " + id);
		try {
			Enroll instance = (Enroll) sessionFactory.getCurrentSession().get(
					"edu.ncsu.gradiance.dao.Enroll", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Enroll instance) {
		log.debug("finding Enroll instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("edu.ncsu.gradiance.dao.Enroll")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
