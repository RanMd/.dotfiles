; inherits: json

;; Nivel 0
(object
  (pair
    key: (string) @json.key.level0))

;; Nivel 1
(object
  (pair
    value: (object
      (pair
        key: (string) @json.key.level1))))

;; Nivel 2
(object
  (pair
    value: (object
      (pair
        value: (object
          (pair
            key: (string) @json.key.level2))))))

;; Nivel 3
(object
  (pair
    value: (object
      (pair
        value: (object
          (pair
            value: (object
              (pair
                key: (string) @json.key.level3))))))))

;; Nivel 4
(object
  (pair
    value: (object
      (pair
        value: (object
          (pair
            value: (object
              (pair
                value: (object
                  (pair
                    key: (string) @json.key.level4))))))))))

;; Nivel 5
(object
  (pair
    value: (object
      (pair
        value: (object
          (pair
            value: (object
              (pair
                value: (object
                  (pair
                    value: (object
                      (pair
                        key: (string) @json.key.level5))))))))))))
