(ns day-11-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-11 :refer [part1 part2]]))

(deftest day-11-test
  (testing "sample data"
    (is (= 0 (part1 "../data/11-sample.txt")))
    (is (= 0 (part2 "../data/11-sample.txt")))))
