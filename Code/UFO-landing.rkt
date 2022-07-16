;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; change the program so that the rocket lands on a ﬂat rock bed that is 10 pixels higher than the bottom of the scene
(define WIDTH 500)
(define HEIGHT 200)
(define MTSCN (empty-scene WIDTH HEIGHT))
; 定义一个红色的scene，长度宽度和MTSCN一致
(define RED-BED (empty-scene WIDTH 10 "red"))
; 再将红色的scene和空白的scene叠加到一起
; 注意这里也是从图形中间开始算，所以横坐标也要用图形的长度除以2
(define ROCKET-RED-BED (place-image RED-BED (/ (image-width RED-BED) 2) (- HEIGHT (/ (image-height RED-BED) 2)) MTSCN))
; 定义火箭图片，改用UFO代替
(define UFO (overlay (circle 10 "solid" "green") (rectangle 40 4 "solid" "green")))
; 计算UFO中心点到最顶点的距离
(define UFO-CENTER-TO-TOP (- HEIGHT (/ (image-height UFO) 2) 10))

; functions
; 定义UFO落地函数
(define (UFO-landing.V2 h)
    (cond 
        [(<= h UFO-CENTER-TO-TOP) (place-image UFO (/ WIDTH 2) h ROCKET-RED-BED)]
        [(> h UFO-CENTER-TO-TOP) (place-image UFO (/ WIDTH 2) UFO-CENTER-TO-TOP ROCKET-RED-BED)]
    )
)