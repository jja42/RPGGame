using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActionManager : MonoBehaviour
{
    public static ActionManager instance;
    public GameObject[] entities;
    public int units_moving;
    public void Start()
    {
        instance = this;
        entities = GameObject.FindGameObjectsWithTag("NPC");
    }
    public void MoveAll()
    {
        units_moving = 0;
        foreach (GameObject entity in entities)
        {
              NPC_action other = (NPC_action)entity.GetComponent(typeof(NPC_action));
            other.think();
        }
        
    }
}
