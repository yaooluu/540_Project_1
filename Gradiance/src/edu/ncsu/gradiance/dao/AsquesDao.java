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
 * Home object for domain model class Asques.
 * @see edu.ncsu.gradiance.dao.Asques
 * @author Hibernate Tools
 */
public class AsquesDao {

	private static final Log log = LogFactory.getLog(AsquesDao.class);

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

	public void persist(Asques transientInstance) {
		log.debug("persisting Asques instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Asques instance) {
		log.debug("attaching dirty Asques instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Asques instance) {
		log.debug("attaching clean Asques instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Asques persistentInstance) {
		log.debug("deleting Asques instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Asques merge(Asques detachedInstance) {
		log.debug("merging Asques instance");
		try {
			Asques result = (Asques) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Asques findById(java.lang.Integer id) {
		log.debug("getting Asques instance with id: " + id);
		try {
			Asques instance = (Asques) sessionFactory.getCurrentSession().get(
					"edu.ncsu.gradiance.dao.Asques", id);
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

	public List findByExample(Asques instance) {
		log.debug("finding Asques instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("edu.ncsu.gradiance.dao.Asques")
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
