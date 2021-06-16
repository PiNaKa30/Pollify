package com.pinaka30.pollify.service;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.type.Type;
import org.springframework.stereotype.Service;

@Service
public class IdGeneratorService implements IdentifierGenerator, Configurable{
	
	private String key;

	@Override
	public void configure(Type type, Properties params, ServiceRegistry serviceRegistry) throws MappingException {
		key = params.getProperty("KEY");	
	}

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		Connection connection = session.connection();
		int count = 1;
		try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT Value FROM id_gen WHERE Id='" + key + "';");
            if(rs.next()) {
            	count = rs.getInt(1) + 1;
            	rs.close();
            	statement.executeUpdate("UPDATE id_gen SET Value=" + count + " WHERE Id='" + key + "';");
            } else {
            	rs.close();
            	statement.executeUpdate("INSERT INTO id_gen VALUES('" + key + "', 1);");
            }
		} catch (Exception e) {
			System.err.println("---SQL Error---" + e.getMessage());
		}
		
		return key + String.format("%03d", count);
	}

}
