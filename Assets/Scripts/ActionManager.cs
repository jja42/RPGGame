using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActionManager : MonoBehaviour
{
    public static ActionManager instance;
    public GameObject[] entities;
    public GameObject player;
    public int units_moving;
    public void Start()
    {
        instance = this;
        //entities = GameObject.FindGameObjectsWithTag("Enemy");
        player = GameObject.FindGameObjectsWithTag("Player")[0];
        if (Save_Load_Manager.instance.data.saved != 0)
        {
            player.transform.position = Save_Load_Manager.instance.data.player.toVector3();
        }
    }
    public void MoveAll()
    {
        units_moving = 0;
        foreach (GameObject entity in entities)
        {
              NPC_action other = (NPC_action)entity.GetComponent(typeof(NPC_action));
            other.think();
        }
        Save_Load_Manager.instance.data.player = new Position(player.transform.position);
        Save_Load_Manager.instance.data.saved = 1;
    }
    public void Save()
    {
        Save_Load_Manager.instance.Save();
    }
}
