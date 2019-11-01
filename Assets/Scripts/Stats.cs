using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Stats : MonoBehaviour
{
    public Transform player;
    public Text stats;
    // Start is called before the first frame update
    void Start()
    {
        player.position = Save_Load_Manager.instance.data.player_pos.toVector3();
    }

    // Update is called once per frame
    void Update()
    {
        string s = "";
        s += "Fire: " + Save_Load_Manager.instance.data.fire + "\n";
        s += "Water: " + Save_Load_Manager.instance.data.water + "\n";
        s += "Wind: " + Save_Load_Manager.instance.data.wind + "\n";
        s += "Earth: " + Save_Load_Manager.instance.data.earth + "\n";
        s += "Lightning: " + Save_Load_Manager.instance.data.lightning + "\n";
        s += "Power: " + Save_Load_Manager.instance.data.power + "\n";
        s += "Defense: " + Save_Load_Manager.instance.data.defense + "\n";
    }
}
