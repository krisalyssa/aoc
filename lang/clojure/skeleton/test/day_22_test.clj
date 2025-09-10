(ns day-22-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-22 :refer [part1 part2]]))

(deftest day-22-test
  (testing "sample data"
    (is (= 0 (part1 "../data/22-sample.txt")))
    (is (= 0 (part2 "../data/22-sample.txt")))))
