using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class PlayerCont : MonoBehaviour
{
    public DialogueManager dialogueManager;
    Vector2 input;
    bool isMoving = false;
    Vector3 startPos;
    Vector3 endPos;
    float t;
    public Animator animator;
    public float walkSpeed = 3f;
    public Stats stats;

    // Start is called before the first frame update
    void Start()
    {
        animator = gameObject.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            //stats.gameObject.SetActive(!stats.gameObject.activeSelf);
        }
        if (Input.GetKeyDown(KeyCode.Space))
        {

        }
        //if (!isMoving && !dialogueManager.talking && ActionManager.instance.units_moving <= 0)
        if (!isMoving)
        {
            input = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));
            if (Mathf.Abs(input.x) > Mathf.Abs(input.y))
            {
                input.y = 0;
            }
            else
            {
                input.x = 0;
            }
            if (input != Vector2.zero)
            {
                if (input.x < 0)
                {
                 
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);
                }
                else if (input.x > 0)
                {
                    
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);

                }
                else if (input.y < 0)
                {
                   
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);

                }
                else if (input.y > 0)
                {
               
                    animator.SetFloat("Horizontal", input.x);
                    animator.SetFloat("Vertical", input.y);
                    animator.SetFloat("LastHorizontal", input.x);
                    animator.SetFloat("LastVertical", input.y);

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
        t = 0;
        endPos = new Vector3(startPos.x + (.5f *System.Math.Sign(input.x)), startPos.y + (.5f *System.Math.Sign(input.y)), startPos.z);
        while (t < 1f)
        {
            t += Time.deltaTime * walkSpeed;
            entity.position = Vector3.Lerp(startPos, endPos, t);
            yield return 0;
        }
        //ActionManager.instance.MoveAll();
        isMoving = false;
        yield return 0;
    }
    public IEnumerator Attack(Transform entity)
    {
        isMoving = true;
        startPos = entity.position;
        t = 0;
        endPos = new Vector3(startPos.x + (.5f * System.Math.Sign(input.x)), startPos.y + (.5f * System.Math.Sign(input.y)), startPos.z);
        while (t < .5f)
        {
            t += Time.deltaTime * walkSpeed;
            entity.position = Vector3.Lerp(startPos, endPos, t);
            yield return 0;
        }
        while (t < 1f)
        {
            t += Time.deltaTime * walkSpeed;
            entity.position = Vector3.Lerp(endPos, startPos, t);
            yield return 0;
        }
        //ActionManager.instance.MoveAll();
        isMoving = false;
        yield return 0;
    }
}