using UnityEngine;
using System.Collections;

public class cameracont : MonoBehaviour
{

    public GameObject player;

    private Vector3 offset;

    void Start()
    {
        offset = new Vector3(0, 0, -10);
    }

    void LateUpdate()
    {
        transform.position = player.transform.position + offset;
    }
}