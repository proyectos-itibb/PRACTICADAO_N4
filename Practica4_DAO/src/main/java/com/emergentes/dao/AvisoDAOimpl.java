package com.emergentes.dao;

import com.emergentes.modelo.Aviso;
import com.emergentes.utiles.ConexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AvisoDAOimpl extends ConexionBD implements AvisoDAO {

    @Override
    public void insert(Aviso aviso) throws Exception {
        String sql = "insert into post (fecha,titulo,contenido) values (?,?,?)";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, aviso.getFecha());
        ps.setString(2, aviso.getTitulo());
        ps.setString(3, aviso.getContenido());

        ps.executeUpdate();
        this.desconectar();
    }

    @Override
  
public void update(Aviso aviso) throws Exception {
    String sql = "update post set fecha=?, titulo=?, contenido=? where id=?";
    this.conectar();
    PreparedStatement ps = this.conn.prepareStatement(sql);
    ps.setString(1, aviso.getFecha());
    ps.setString(2, aviso.getTitulo());
    ps.setString(3, aviso.getContenido());
    ps.setInt(4, aviso.getId());
    ps.executeUpdate();
    this.desconectar();
}


    @Override
    public void delete(int id) throws Exception {
        String sql = "delete from post where id=?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public List<Aviso> getAll() throws Exception {
        List<Aviso> lista = null;
        String sql = "select * from post";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        lista = new ArrayList<Aviso>();
        while (rs.next()) {
            Aviso avi = new Aviso();

            avi.setId(rs.getInt("id"));
            avi.setFecha(rs.getString("fecha"));
            avi.setTitulo(rs.getString("titulo"));
            avi.setContenido(rs.getString("contenido"));
            lista.add(avi);
        }
        this.desconectar();
        return lista;
    }

    @Override
    public Aviso getById(int id) throws Exception {
        Aviso avi = new Aviso();
        try {
            String sql = "select * from post where id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                avi.setId(rs.getInt("id"));
                avi.setFecha(rs.getString("fecha"));
                avi.setTitulo(rs.getString("titulo"));
                avi.setContenido(rs.getString("contenido"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return avi;
    }

    /**
     *
     */
    @Override
    public void renumerarIDs() {
        String sql1 = "SET @new_id = 0;";
        String sql2 = "UPDATE post SET id = (@new_id := @new_id + 1) ORDER BY id;";
        try (Statement stmt = conn.createStatement()) {
            stmt.execute(sql1);
            stmt.execute(sql2);
        } catch (SQLException ex) {
            System.out.println("Error al renumerar los IDs: " + ex.getMessage());
        }
    }

}
