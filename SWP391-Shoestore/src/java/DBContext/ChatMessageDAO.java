/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.ChatMessage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

public class ChatMessageDAO extends DBcontext {

    public int insertMessage(ChatMessage mes) throws Exception {
        int status = 0;
        String sql = "insert into ChatMessage(fromId,toId,content,status) values(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, mes.getFromId());
            ps.setInt(2, mes.getToId());
            ps.setString(3, mes.getContent());
            ps.setInt(4, 1);

            status = ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            throw e;
        }
        return status;
    }

    public ArrayList<ChatMessage> getListMessageThroughTwoFriendId(int yourId, int friendId) throws Exception {

        ArrayList<ChatMessage> messList = new ArrayList<>();
        String sql = "select top 1 * from [ChatMessage] where (fromId= ? and toId= ?) or (fromId= ? and toId= ?) order by dateCreated asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, yourId);
            ps.setInt(2, friendId);
            ps.setInt(3, friendId);
            ps.setInt(4, yourId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChatMessage mess = new ChatMessage(rs.getInt("mId"), rs.getInt("fromId"), rs.getInt("toId"), rs.getString("content"), rs.getDate("dateCreated"), rs.getInt("status"));
                messList.add(mess);
            }
        } catch (Exception e) {
            throw e;
        }
        return messList;
    }

    public ArrayList<ChatMessage> getNewMessageThroughTwoFriendId(int yourId, int friendId, int offset) throws Exception {
        ArrayList<ChatMessage> messList = new ArrayList<>();
        String sql = "select * from [ChatMessage] where (fromId= ? and toId= ?) or (fromId= ? and toId= ?) order by dateCreated asc offset ? ROWS";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, yourId);
            ps.setInt(2, friendId);
            ps.setInt(3, friendId);
            ps.setInt(4, yourId);
            ps.setInt(5, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChatMessage mess = new ChatMessage(rs.getInt("mId"), rs.getInt("fromId"), rs.getInt("toId"), rs.getString("content"), rs.getDate("dateCreated"), rs.getInt("status"));
                messList.add(mess);
            }
        } catch (Exception e) {
            throw e;
        }
        return messList;
    }

    public ChatMessage getLatestMessageThroughTwoFriendId(int yourId, int friendId) throws Exception {
        ChatMessage mess = new ChatMessage();
        String sql = "select top 1 * from [ChatMessage] where (fromId= ? and toId= ?) or (fromId= ? and toId= ?) order by dateCreated desc";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, yourId);
            ps.setInt(2, friendId);
            ps.setInt(3, friendId);
            ps.setInt(4, yourId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                mess = new ChatMessage(rs.getInt("mId"), rs.getInt("fromId"), rs.getInt("toId"), rs.getString("content"), rs.getDate("dateCreated"), rs.getInt("status"));
            }
        } catch (Exception e) {
            throw e;
        }
        return mess;
    }
}
