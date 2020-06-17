package cc.openhome.model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface preStatement
{
    void setValues(PreparedStatement ps) throws SQLException;
}
