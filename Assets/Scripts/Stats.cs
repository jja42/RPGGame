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

    }

    // Update is called once per frame
    void Update()
    {
        string s = "";
        s += "Level: " + Save_Load_Manager.instance.data.level + "\t\t";
        s += "Exp: " + Save_Load_Manager.instance.data.exp + "\n";
        //s += "Fire: " + Save_Load_Manager.instance.data.fire + "\t\t";
       // s += "Water: " + Save_Load_Manager.instance.data.water + "\n";
        //s += "Wind: " + Save_Load_Manager.instance.data.wind + "\t\t";
        //s += "Earth: " + Save_Load_Manager.instance.data.earth + "\n";
        //s += "Lightning: " + Save_Load_Manager.instance.data.lightning + "\t\t";
        s += "Power: " + Save_Load_Manager.instance.data.power + "\n";
        s += "Defense: " + Save_Load_Manager.instance.data.defense + "\t\t";
        s += "Accuracy: " + Save_Load_Manager.instance.data.accuracy + "\n";
        s += "Dodge: " + Save_Load_Manager.instance.data.dodge + "\t\t";
        s += "Counter: " + Save_Load_Manager.instance.data.counter + "\n";
        s += "Health: " + Save_Load_Manager.instance.data.health + "\t\t";
        s += "HP: " + Save_Load_Manager.instance.data.health_points + "\n";
        s += "Aggression: " + Save_Load_Manager.instance.data.rep[0] + "\t\t";
        s += "Empathy: " + Save_Load_Manager.instance.data.rep[2] + "\n";
        s += "Pragmatism: " + Save_Load_Manager.instance.data.rep[1] + "\t\t";
        s += "Apathy: " + Save_Load_Manager.instance.data.rep[3] + "\n";
        stats.text = s;
        
    }
}
