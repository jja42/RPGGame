using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ItemTooltip : MonoBehaviour
{
    private Text tooltip;
    // Start is called before the first frame update
    void Start()
    {
        tooltip = GetComponentInChildren<Text>();
        tooltip.gameObject.SetActive(false);
    }
    public void GenerateTooltip(Item item)
    {
        string statsText = "";
        if(item.stats.Count > 0)
        {
            foreach (var stat in item.stats)
            {
                statsText += stat.Key.ToString()  + ":"  + stat.Value.ToString() + "\n";
            }
        }
        tooltip.text = statsText;
        gameObject.SetActive(true);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
