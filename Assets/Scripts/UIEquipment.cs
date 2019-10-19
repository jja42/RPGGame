using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIEquipment : MonoBehaviour
{
    public List<UIItem> UIItems = new List<UIItem>();
    public GameObject slotPrefab;
    public Transform slotPanel;
    public int numberOfSlots = 5;
    private void Start()
    {
        for (int i = 0; i < numberOfSlots; i++)
        {
            GameObject instance = Instantiate(slotPrefab);
            instance.transform.SetParent(slotPanel);
            UIItems.Add(instance.GetComponentInChildren<UIItem>());
        }
    }
    public void UpdateSlot(int slot, Item item)
    {
        UIItems[slot].UpdateItem(item);
    }
    public void AddNewItem(Item item)
    {
        UpdateSlot(UIItems.FindIndex(i => i == null || i.item == null), item);
    }
    public void RemoveItem(Item item)
    {
        UpdateSlot(UIItems.FindIndex(i => i == null || i.item == item), null);
    }
}
