(ns day-13-test
  (:require
   [clojure.test :refer [deftest is testing]]
   [day-13 :refer [part1 part2]]))

(deftest day-13-test
  (testing "sample data"
    (is (= 0 (part1 "../data/13-sample.txt")))
    (is (= 0 (part2 "../data/13-sample.txt")))))
