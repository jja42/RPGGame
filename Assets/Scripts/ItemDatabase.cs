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
        items = new List<Item>() {
            new Item(0, "Sword", "A sharp tool for clearing foes", new Dictionary<string, int> {
                { "Power", 5 },
                { "Value", 10 } }),
            new Item(1, "Shield", "A blunt barricade against your enemies", new Dictionary<string, int> {
                { "Defense", 5 },
                { "Value", 10 }}),
            new Item(2, "Emerald", "A shiny green gem that's known to be worth some coin", new Dictionary<string, int>{
                {"Value", 25 } }),
            new Item(3, "Diamond", "A lustrous gem that's priceless to some and expensive for others", new Dictionary<string, int>{
                {"Value", 50 } }),
            new Item(4, "Gold", "Good ol' Gold, just as pricey as ever", new Dictionary<string, int>{
                {"Value", 100 } }),
            new Item(4, "Potion", "Magical healing red elixer", new Dictionary<string, int>{
                {"Healing",10 },{"Value", 25 } })
        };
    }
}
