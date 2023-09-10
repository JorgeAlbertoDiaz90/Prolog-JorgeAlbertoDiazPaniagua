/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.fibonacci;

/**
 *
 * @author jorge
 */
public class Fibonacci {

    public static void main(String[] args) {
        
        int n = 10; // Cambia este valor para generar más o menos términos
        long[] fibonacciSeries = new long[n];

        // Inicializar los dos primeros términos de la serie
        fibonacciSeries[0] = 0;
        fibonacciSeries[1] = 1;

        // Generar los términos restantes de la serie
        for (int i = 2; i < n; i++) {
            fibonacciSeries[i] = fibonacciSeries[i - 1] + fibonacciSeries[i - 2];
        }

        // Imprimir la serie de Fibonacci
        for (int i = 0; i < n; i++) {
            System.out.print(fibonacciSeries[i] + " ");
        }
    }
}

