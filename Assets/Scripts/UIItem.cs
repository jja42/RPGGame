using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class UIItem : MonoBehaviour, IPointerClickHandler
{
    public Item item;
    private Image spriteImage;
    private UIItem selectedItem;
    private ItemTooltip tooltip;
    private void Awake()
    {
        spriteImage = GetComponent<Image>();
        UpdateItem(null);
        //selectedItem = GameObject.Find("SelectedItem").GetComponent<UIItem>();
        //tooltip = GameObject.Find("Tooltip").GetComponent<ItemTooltip>();
    }

    public void UpdateItem(Item item)
    {
        this.item = item;
        if (this.item != null)
        {
            spriteImage.color = Color.white;
            spriteImage.sprite = this.item.icon;
        }
        else
        {
            spriteImage.color = Color.clear;
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (this.item != null)
        {
           if(this.item.title == "Sword")
            {
                Save_Load_Manager.instance.data.power = this.item.stats["Power"];
            }
            if (this.item.title == "Shield")
            {
                Save_Load_Manager.instance.data.defense = this.item.stats["Defense"];
            }
            if (this.item.title == "Potion")
            {
                Save_Load_Manager.instance.data.health_points += this.item.stats["Healing"];
                Save_Load_Manager.instance.data.health_points -= Save_Load_Manager.instance.data.health_points % Save_Load_Manager.instance.data.max_health_points;
                this.item = null;
            }
        }
    }

}