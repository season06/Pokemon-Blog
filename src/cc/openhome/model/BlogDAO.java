package cc.openhome.model;

import java.util.List;

public interface BlogDAO
{
    List<Blog> getInfo(Blog info);
    void addInfo(Blog info);
    void delInfo(Blog info);
}
