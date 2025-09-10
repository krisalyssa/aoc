(ns day-08
  (:gen-class))

(require '[clojure.string :as str])

;; (defn read-file-as-one-string
;;   "Reads the file and returns it as a single string."
;;   [filename]
;;   (str/trim-newline (slurp filename)))

(defn read-file-as-string-list
  "Reads the file and returns it as a list of strings."
  [filename]
  (str/split-lines
   (slurp filename)))

(defn part1 [_data]
  0)

(defn part2 [_data]
  0)

(defn -main []
  (printf "day 08 part 1: %d%n" (part1 (read-file-as-string-list "../data/08.txt")))
  (printf "day 08 part 2: %d%n" (part2 (read-file-as-string-list "../data/08.txt"))))
