using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Walking_Gal : NPC_action
{
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
        if (steps == 6)
        {
            steps = 0;
        }
        if (steps < 3)
        {
            endPos = new Vector3(startPos.x + 1, startPos.y, startPos.z);
        }
        else
        {
            endPos = new Vector3(startPos.x - 1, startPos.y, startPos.z);
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
