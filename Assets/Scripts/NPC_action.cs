using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class NPC_action : MonoBehaviour
{
    protected Vector3 startPos;
    protected Vector3 endPos;
    protected float t;
    public float walkSpeed = 3f;
    public abstract void think();
    public abstract IEnumerator Move(Transform entity);
}