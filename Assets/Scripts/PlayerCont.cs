using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class PlayerCont : MonoBehaviour
{
    public DialogueManager dialogueManager;
    Direction currentDir;
    Vector2 input;
    bool isMoving = false;
    Vector3 startPos;
    Vector3 endPos;
    float t;
    public Sprite northSprite;
    public Sprite sideSprite;
    public Sprite southSprite;
    public SpriteRenderer spriterenderer;
    public Animator animator;
    public float walkSpeed = 3f;
    public enum Direction
    {
        North,
        East,
        South,
        West
    }

    // Start is called before the first frame update
    void Start()
    {
        animator = gameObject.GetComponent<Animator>();
        spriterenderer = gameObject.GetComponent<SpriteRenderer>();
    }

    // Update is called once per frame
    void Update()
    {
            if (!isMoving && !dialogueManager.talking && ActionManager.instance.units_moving <= 0)
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
                        currentDir = Direction.West;
                        animator.SetFloat("Horizontal", input.x);
                        animator.SetFloat("Vertical", input.y);
                    }
                    else if (input.x > 0)
                    {
                        currentDir = Direction.East;
                        animator.SetFloat("Horizontal", input.x);
                        animator.SetFloat("Vertical", input.y);

                    }
                    else if (input.y < 0)
                    {
                        currentDir = Direction.South;
                        animator.SetFloat("Horizontal", input.x);
                        animator.SetFloat("Vertical", input.y);

                    }
                    else if (input.y > 0)
                    {
                        currentDir = Direction.North;
                        animator.SetFloat("Horizontal", input.x);
                        animator.SetFloat("Vertical", input.y);

                    }

                    StartCoroutine(Move(transform));
                    SetSprite(currentDir);
                }
                else
                {
                    animator.SetFloat("Horizontal", 0);
                    animator.SetFloat("Vertical", 0);
                }
                if (Input.GetKeyDown("space"))
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
        endPos = new Vector3(startPos.x + System.Math.Sign(input.x), startPos.y + System.Math.Sign(input.y), startPos.z);
        while (t < 1f)
        {
            t += Time.deltaTime * walkSpeed;
            entity.position = Vector3.Lerp(startPos, endPos, t);
            yield return 0;
        }
        isMoving = false;
        ActionManager.instance.MoveAll();
        yield return 0;
    }
    public void SetSprite(Direction currentDir)
    {
        switch (currentDir)
        {
            case Direction.North:
                {
                    spriterenderer.sprite = northSprite;
                    break;
                }
            case Direction.East:
                {
                    spriterenderer.sprite = sideSprite;
                    break;
                }
            case Direction.West:
                {
                    spriterenderer.sprite = sideSprite;
                    spriterenderer.flipX = true;
                    break;
                }
            case Direction.South:
                {
                    spriterenderer.sprite = southSprite;
                    break;
                }
        }
    }
    public int getAggression()
    {
        return getRep(0);
    }
    public int getApathy()
    {
        return getRep(3);
    }
    public int getEmpathy()
    {
        return getRep(2);
    }
    public int getPragmatism()
    {
        return getRep(1);
    }

    public int getRep(int i)
    {
        return dialogueManager.rep[i];
    }
}