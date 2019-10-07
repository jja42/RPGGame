using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemDatabase : MonoBehaviour
{
    public List<Item> items = new List<Item>();
    public void Awake()
    {
        BuildDatabase();
    }

    public Item GetItem(string itemName)
    {
        return items.Find(item => item.title == itemName);
    }
    void BuildDatabase()
    {
        items = new List<Item>(){
            new Item(0,"Sword","A sharp tool for clearing foes", new Dictionary<string,int>{
                {"Power", 2},
                {"Value", 10}}
                )};
    }
}
