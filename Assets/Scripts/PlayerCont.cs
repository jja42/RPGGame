using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerCont : MonoBehaviour
{
    public DialogueManager dialogueManager;
    Vector2 input;
    bool isMoving = false;
    Vector3 startPos;
    private Vector3 startRotation;
    private Vector3 endRotation;
    Vector3 endPos;
    float t;
    public Animator animator;
    public float walkSpeed = 3f;
    public Stats stats;
    private Transform camera_t;

    // Start is called before the first frame update
    void Start()
    {
        animator = gameObject.GetComponent<Animator>();
        camera_t = gameObject.GetComponent<Camera>().transform;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            stats.gameObject.SetActive(!stats.gameObject.activeSelf);
            
        }
        if (Input.GetKeyDown(KeyCode.Space))
        {

        }
        //if (!isMoving && !dialogueManager.talking && ActionManager.instance.units_moving <= 0)
        if (!isMoving)
        {
            input = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));
            if (input != Vector2.zero)
            {
                animator.SetBool("Moving",true);
                }
                StartCoroutine(Move(transform));
            }
            else
            {
                animator.SetFloat("Horizontal", 0);
                 animator.SetFloat("Vertical", 0);
            }
            if (Input.GetKeyDown(KeyCode.Return))
            {
                NPCFind(transform.position);
            }
        }
    void NPCFind(Vector3 center)
    {
        float radius = 0.7f;
        Collider2D[] hitColliders = Physics2D.OverlapCircleAll(center, radius);
        int i = 0;
        if (hitColliders[i] != null)
        {
            GameObject npc = hitColliders[i].gameObject;
            dialogueManager.PlayDialogue(npc.name);
        }
    }
    public IEnumerator Move(Transform entity)
    {
        isMoving = true;
        startPos = entity.position;
        startRotation = entity.eulerAngles;
        endRotation = new Vector3(entity.eulerAngles.x, entity.eulerAngles.y + System.Math.Sign(input.x) * 90.0f, entity.eulerAngles.z);
        t = 0;
        endPos = (startPos + ((1 * System.Math.Sign(input.y))*entity.forward) + ((1 * System.Math.Sign(input.x))*entity.right));
        //camera_t
        while (t < 1f)
        {
            t += Time.deltaTime * walkSpeed;
            //entity.position = Vector3.Lerp(startPos, endPos, t);
            entity.eulerAngles = Vector3.Lerp(startRotation, endRotation, t);
            yield return 0;
        }
        //ActionManager.instance.MoveAll();
        isMoving = false;
        yield return 0;
    }
    public IEnumerator Attack(Transform entity)
    {
        isMoving = true;
        //ActionManager.instance.MoveAll();
        isMoving = false;
        yield return 0;
    }
}