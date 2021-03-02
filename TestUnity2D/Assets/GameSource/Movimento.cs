using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Classe base che fa muovere un cerchio usando le frecce.

public class Movimento : MonoBehaviour
{
    public float speed = 5; 

    void Start()
    {
        
    }

    // Update - si aggiorna ad ogni fotogramma
    void Update()
    {
        float movimentoO = Input.GetAxis("Horizontal");
        float movimentoV = Input.GetAxis("Vertical");

        Vector3 direzione = new Vector3(0,0,0);

        if(movimentoO != 0){
            direzione.x = movimentoO;
        }

        if(movimentoV != 0){
            direzione.y = movimentoV;
        }

    transform.Translate(direzione * (speed * Time.deltaTime));
    }
}
