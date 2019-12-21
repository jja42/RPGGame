using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : NPC_action
{
    private void Start()
    {
        int health = 10;
        int power = 3;
        int defense = 0;
    }
    int steps = 0;
    public override void think()
    {
        StartCoroutine(Move(transform));
    }

    public override IEnumerator Move(Transform entity)
    {
        ActionManager.instance.units_moving++;
        startPos = entity.position;
        t = 0;
        if (Save_Load_Manager.instance.data.player.x > transform.position.x)
        {
            endPos = new Vector3(startPos.x + 1, startPos.y, startPos.z);
        }
        else if (Save_Load_Manager.instance.data.player.x < transform.position.x)
        {
            endPos = new Vector3(startPos.x - 1, startPos.y, startPos.z);
        }
        else if (Save_Load_Manager.instance.data.player.y > transform.position.x)
        {
            endPos = new Vector3(startPos.x, startPos.y + 1, startPos.z);
        }
        else if (Save_Load_Manager.instance.data.player.y > transform.position.x)
        {
            endPos = new Vector3(startPos.x, startPos.y - 1, startPos.z);
        }
        else
        {
            endPos = startPos;
            if((power - Save_Load_Manager.instance.data.defense) > 0)
            Save_Load_Manager.instance.data.health_points -= power - Save_Load_Manager.instance.data.defense;
        }
        steps++;
        while (t < 1f)
        {
            t += Time.deltaTime * walkSpeed;
            entity.position = Vector3.Lerp(startPos, endPos, t);
            yield return 0;
        }
        ActionManager.instance.units_moving--;
    }
}
